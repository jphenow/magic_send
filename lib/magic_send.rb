require "magic_send/version"

class Object
  def magic_send(*args)
    MagicSend::MagicSender.magic self, args
  end
end

module MagicSend
  class MagicSender
    def self.magic(obj, args)
      new(obj, args).wave_wand
    end

    def initialize(object, args)
      @object = object
      @args = args
      @tries = 0
      get_method
    end

    def wave_wand
      call
    end

    private

    def call
      too_many? ? blow_up : @object.send(@method)
    rescue ArgumentError
      try_again
      call
    end

    def too_many?
      @tries > 200
    end

    def blow_up
      puts "Your magic needs some work. Please try again."
    end

    def try_again
      @method = nil
      @tries += 1
      get_method
    end

    def get_method
      @method ||= @object.methods.sample
    end

    def arity
      @method.arity
    end
  end
end
