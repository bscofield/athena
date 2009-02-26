module Athena
  class Resource
    extend Athena::Persistence
    attr_accessor :template
    
    def self.inherited(f)
      unless f == Athena::SingletonResource
        url_name = f.name.downcase
        routing = url_name + id_pattern
        url_pattern = /^\/#{routing}$/

        Athena::Application.route_map[:get][/^\/#{routing}\/edit$/] = {:class => f, :template => 'edit'}
        Athena::Application.route_map[:get][/^\/#{url_name}\/new$/] = {:class => f, :template => 'new'}
        Athena::Application.route_map[:post][/^\/#{url_name}$/]     = {:class => f, :template => 'post'}
        [:get, :put, :delete].each do |m|
          Athena::Application.route_map[m][url_pattern] = {:class => f, :template => m.to_s}
        end
      end
    end
    
    def self.default_resource
      Athena::Application.route_map[:get][/^\/$/] = {:class => self, :template => 'get'}
    end
    
    def self.id_pattern
      '\/(\d+)'
    end
    
    def output
      self.send(@method)

      template = ERB.new(IO.read(File.join(Athena::Application.root, 'resources', self.class.name.downcase, "#{self.template}.erb")))
      response = template.result(binding)
      response = [response] unless response.respond_to?(:each)

      [200, {'Content-Type' => 'text/html'}, response]
    end
    
    def initialize(req, request_method, params)
      @request = req
      @method  = request_method
      @params  = params
      @id      = req.path_info.scan(/#{self.class.id_pattern}/).flatten.first
    end

    def get;    raise Athena::MethodNotAllowed; end
    def put;    raise Athena::MethodNotAllowed; end
    def post;   raise Athena::MethodNotAllowed; end
    def delete; raise Athena::MethodNotAllowed; end
  end
end

# TODO: refactor ERB processing into a module
# TODO: MethodNotAllowed exception should return allowed methods
# TODO: automatically create singleton/collection resource? unless specified not to
  # TODO: default_resource changes to default_resource([nil || :collection])
# PRESENTATION: method_missing and self.method_missing for API intuitiveness DOESN'T WORK
# PRESENTATION: issues with class/eigenclass/object 

# TODO: redirects