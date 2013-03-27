module Rubino
  # Executes commands
  class Executor
   
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
  end
end
