require 'deployml/shell_session'

module DeploYML
  module Utils
    #
    # Converts a given URI to one compatible with `ssh`.
    #
    # @param [Addressable::URI] uri
    #   The URI to convert.
    #
    # @return [String]
    #   The `ssh` compatible URI.
    #
    def ssh_uri(uri)
      new_uri = uri.host

      new_uri = "#{uri.user}@#{new_uri}" if uri.user

      return new_uri
    end

    #
    # Converts a given URI to one compatible with `rsync`.
    #
    # @param [Addressable::URI] uri
    #   The URI to convert.
    #
    # @return [String]
    #   The `rsync` compatible URI.
    #
    def rsync_uri(uri)
      new_uri = uri.host

      new_uri = "#{uri.user}@#{new_uri}" if uri.user
      new_uri = "#{new_uri}:#{uri.path}" unless uri.path.empty?

      return new_uri
    end

    #
    # Generates options for `ssh`.
    #
    # @param [Array] opts
    #   Specific options to pass to `ssh`.
    #
    # @return [Array]
    #   Options to pass to `ssh`.
    #
    def ssh_options(*opts)
      options = []

      options << '-v' if config.debug

      return options + opts
    end

    #
    # Generates options for `rsync`.
    #
    # @param [Array] opts
    #   Specific options to pass to `rsync`.
    #
    # @return [Array]
    #   Options to pass to `rsync`.
    #
    def rsync_options(*opts)
      options = []

      options << '-v' if config.debug

      return options + opts
    end

    #
    # Runs a program locally.
    #
    # @param [String] program
    #   The name of path of the program to run.
    #
    # @param [Array] args
    #   Additional arguments to run the program with.
    #
    def sh(program,*args)
      debug "#{program} #{args.join(' ')}"

      system(program,*args)
    end

    #
    # Starts a SSH session with the destination server.
    #
    # @param [Array] args
    #   Additional arguments to pass to SSH.
    #
    def ssh(*args)
      options = ssh_options()

      # Add the -p option if an alternate destination port is given
      if dest_uri.port
        options += ['-p', dest_uri.port.to_s]
      end

      options << ssh_uri(dest_uri)
      options += args

      return system('ssh',*options)
    end

    #
    # Runs a command remotely on the destination server.
    #
    # @param [Array] args
    #   The arguments of the remote command.
    #
    # @yield [session]
    #   If a block is given, it will be passed a shell, which is used to
    #   build up a session.
    #
    # @yieldparam [ShellSession] session
    #   The shell session.
    #
    def remote_sh(*args,&block)
      if dest_uri.host
        session = ShellSession.new() do |shell|
          shell.cd(dest_uri.path) if dest_uri.path

          shell.run(*args) unless args.empty?
          block.call(shell) if block
        end

        command = session.commands.map { |*args|
          args.join(' ')
        }.join(' && ')

        debug "[#{dest_uri.host}] #{command}"
        return ssh(command)
      else
        return sh(*args)
      end
    end

    #
    # Executes a Rake task on the deployment server.
    #
    # @param [String, Symbol] name
    #   The rake task to run.
    #
    # @param [Array] args
    #   Additional arguments to pass to the rake task.
    #
    def remote_task(name,*args)
      remote_sh { |shell| shell.rake(name,*args) }
    end

    #
    # Prints a debugging message, only if {#debug} is enabled.
    #
    # @param [String] message
    #   The message to print.
    #
    def debug(message)
      STDERR.puts "[debug] #{message}" if config.debug
    end
  end
end
