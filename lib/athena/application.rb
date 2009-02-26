module Athena
  class Application
    def self.root
      File.join(File.dirname(__FILE__), '..', '..', '..', '..')
    end
    
    def self.route_map
      @route_map ||= {
        :get    => {},
        :post   => {},
        :put    => {},
        :delete => {}
      }
      @route_map
    end
    
    def process_params(params)
      nested_pattern = /^(.+?)\[(.*\])/
      processed = {}
      params.each do |k, v|
        if k =~ nested_pattern
          scanned = k.scan(nested_pattern).flatten
          first = scanned.first
          last  = scanned.last.sub(/\]/, '')
          if last == ''
            processed[first] ||= []
            processed[first] << v
          else
            processed[first] ||= {}
            processed[first][last] = v
            processed[first] = process_params(processed[first])
          end
        else
          processed[k] = v
        end
      end
      processed.delete('_method')
      processed
    end
    
    def call(environment)
      request = Rack::Request.new(environment)
      request_method = request.params['_method'] ? request.params['_method'].downcase.to_sym : request.request_method.downcase.to_sym
      
      params = process_params(request.params)
      
      matching_route = Athena::Application.route_map[request_method].detect {|regex, v|
        regex =~ request.path_info
      }

      if matching_route
        resource = matching_route.last[:class].new(request, request_method, params)
        resource.template = matching_route.last[:template]
        return resource.output
      else
        raise Athena::BadRequest
      end
    end
  end
end

# TODO: Set ATHENA_ROOT constant in some way
# TODO: Extract routing to a module
# PRESENTATION: framework is routing and response (resource.output)