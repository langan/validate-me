require 'rack'
require 'validate-me/response_file'
require 'w3c_validators'
require 'erb'

include ERB::Util

module Rack
  class Validate
    class Validator
      include W3CValidators

      def self.validate( response )
        validator = MarkupValidator.new
        # Wrap response in ResponseFile class so that we can use #validate_file
        # this ensures that long responses won't error out
        validator.validate_file( ResponseFile.new(response) )
      end

      def self.generate_report( issues )
        @issues = issues
        @template ||= ::ERB.new ::File.read ::File.expand_path("../templates/validate-me-bar.erb",__FILE__)
        @template.result(binding)
      end
    end
  end
end