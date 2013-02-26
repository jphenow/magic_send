require "magic_send/version"

class Object
  def magic_send(*args)
    MagicSend::MagicSender.magic self, args
  end
end

module MagicSend
  class MagicSender
    private
    attr_accessor :object
    attr_accessor :tries
    attr_accessor :args

    public

    def self.magic(obj, args)
      new(obj, args).wave_wand
    end

    def initialize(object, args)
      self.object = object
      self.args = args
      self.tries = 0
      self.method = get_method
    end

    def wave_wand
      call
    end

    def call
      too_many? ? blow_up : object.send(method, *args)
    rescue ArgumentError
      try_again
      call
    end
    private :call

    def too_many?
      tries > 200
    end
    private :too_many?

    def blow_up
      puts "Your magic needs some work. Please try again."
    end
    private :blow_up

    def try_again
      self.tries += 1
      self.method = get_method
    end
    private :try_again

    def get_method
      object.methods.sample
    end
    private

    def arity
      method.arity
    end
    private :arity
  end
end
