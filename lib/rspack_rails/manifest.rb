module RspackRails
    class Manifest
        @mutex = Mutex.new

        def self.load
            @mutex.synchronize do
                manifest_path = Rails.root.join('public', 'packs', 'manifest.json')

                unless File.exist?(manifest_path)
                    raise "Manifest file not found at #{manifest_path}. Make sure Rspack has compiled your assets."
                end

                mtime = File.mtime(manifest_path)
        
                if @manifest.nil? || @manifest_mtime != mtime
                  @manifest = JSON.parse(File.read(manifest_path))
                  @manifest_mtime = mtime
                end
        
                @manifest
            end
        end
  
        def self.lookup(name)
            load[name] || raise("Could not find asset #{name} in manifest")
        end
    end
end