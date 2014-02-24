module Settings
  
  
  extend self
  # again - it's a singleton, thus implemented as a self-extended module
@_settings = {}

def load!(options={})
    @_settings = YAML::load(ERB.new(Rails.root.join("config", "ar_report.yml").read).result).with_indifferent_access
    @_settings = newsets[options[:env].to_sym] if \
                                               options[:env] && \
                                               newsets[options[:env].to_sym]

  end



 def method_missing(name, *args, &block)
    @_settings.with_indifferent_access[name.to_sym] ||
    fail(NoMethodError, "unknown configuration root #{name}", caller)
  end



end
