module Rubino
  # Avrdude wrapper for uploading arduino flash files
  class Hex
    include Adamantium

    include Anima.new(
      :arduino_port,
      :avrdude_path,
      :avrdude_config,
      :programmer_id,
      :baudrate,
      :mcu_type,
      :source
    )
    
    # Upload hex file
    #
    # @example
    #   object = Rubino::Uploader.new(:file => './example.hex')
    #   object.upload
    #
    # @return [self]
    #   
    # @api public
    #
    def upload
      Executor.execute(command)

      self
    end
    
    # Initialize uploader
    #
    # @param [Hash] attributes
    #
    # @return [undefined]
    #   
    # @api private
    #
    def self.new(attributes)
      attributes[:arduino_port] ||= '/dev/ttyACM0'
      attributes[:avrdude_path] ||= 'avrdude'
      attributes[:avrdude_config] ||= '/etc/avrdude.conf'
      attributes[:programmer_id] ||= 'arduino'
      attributes[:baudrate] ||= 115200
      attributes[:mcu_type] ||= 'atmega328p'

      super
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
        #{avrdude_path}
        -V
        -F
        -c #{programmer_id}
        -b #{baudrate}
        -p #{mcu_type}
        -P #{arduino_port}
        -U flash:w:#{source}
        -C #{avrdude_config}
      )
    end
    memoize :command
  end
end

