module Athena
  class BadRequest                  < StandardError; end # 400
  class Unauthorized                < StandardError; end # 401
  class PaymentRequired             < StandardError; end # 402
  class Forbidden                   < StandardError; end # 403
  class PageNotFound                < StandardError; end # 404
  class MethodNotAllowed            < StandardError; end # 405
  class NotAcceptable               < StandardError; end # 406
  class ProxyAuthenticationRequired < StandardError; end # 407
  class RequestTimeout              < StandardError; end # 408
  class Conflict                    < StandardError; end # 409
  class Gone                        < StandardError; end # 410
  class LengthRequired              < StandardError; end # 411
  class PreconditionFailed          < StandardError; end # 412
  class EntityTooLarge              < StandardError; end # 413
  class URITooLong                  < StandardError; end # 414
  class UnsupportedMediaType        < StandardError; end # 415
  class RangeNotSatisfiable         < StandardError; end # 416
  class ExpectationFailed           < StandardError; end # 417
end