module RspackRails
    class Manifest
        def self.load
            manifest_path = Rails.root.join('public', 'packs', 'manifest.json')
            mtime = File.mtime(manifest_path)
      
            if @manifest.nil? || @manifest_mtime != mtime
              @manifest = JSON.parse(File.read(manifest_path))
              @manifest_mtime = mtime
            end
      
            @manifest
        end
  
        def self.lookup(name)
            load[name] || raise("Could not find asset #{name} in manifest")
        end
    end
end