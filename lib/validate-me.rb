require 'rack'
require 'validate-me/validator'
require "pp"

module Rack
  # A rack middleware for validating HTML via w3c validator
  class Validate

    def initialize( app )
      @app = app
    end

    def call( env )
      status, headers, response = @app.call( env )
      request = Rack::Request.new( env )
      if !request.params['rack-validate'].blank?
        if headers['Content-Type'] =~ /text\/html|application\/xhtml\+xml/
          pp response
          body = response[0]

          issues = Validator.validate( body )

          body.gsub!(%r{</body>}, Validator.generate_report( issues )  + "</body>")

          headers["Content-Length"] = body.length.to_s
          response = [body]
        end
      end

      [status, headers, response]
    end
  end
end