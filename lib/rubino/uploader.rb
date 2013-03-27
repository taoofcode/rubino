module Rubino
  # Avrdude wrapper for uploading arduino flash files
  class Uploader
    include Adamantium

    include Anima.new(
      :arduino_port,
      :avrdude_path,
      :avrdude_config,
      :programmer_id,
      :baudrate,
      :mcu_type,
      :file
    )
    
    # Upload file
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
      self.class.execute(command)

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
    
    # Execute command
    #
    # @param [Array<String>] args
    #   arguments to execute command
    # 
    # @return [true]
    #   if command gives zero exit status
    # @return [false]
    #   for non zero exit status
    # @return [nil]
    #   if command execution fails
    #
    # @api private
    #
    def self.execute(args)
      #args << { STDERR => '/dev/null', STDOUT => '/dev/null' }
      Kernel.system(*args)
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
        -U flash:w:#{file}
        -C #{avrdude_config}
      )
    end
    memoize :command
  end
end

