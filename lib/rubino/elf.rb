module Rubino
  # Elf file converter
  class Elf
    include Adamantium

    include Anima.new(
      :source
    )
    
    # Convert elf to intel hex
    #
    # @example
    #   object = Rubino::Elf.new(:source => './example.elf')
    #   object.to_hex
    #
    # @return [Hex]
    #   
    # @api public
    #
    def to_hex
      Executor.execute(command)

      Hex.new(:source => target)
    end

  private
    
    # Return avrdude command
    #
    # @return [String]
    #   avrdude command
    #
    # @api private
    #
    def command
      %W(
        avr-objcopy
        -O ihex
        -R .eeprom
        #{source}
        #{target}
      )
    end
    memoize :command

    # Target path
    #
    # @return [String] target path
    #
    # @api private
    #
    def target
      source.sub(/[^.]+\z/,'hex')
    end
    memoize :target
  end
end
