module RspackRails
    class Manifest
      def self.load
        @manifest ||= JSON.parse(File.read(Rails.root.join('public', 'packs', 'manifest.json')))
      end
  
      def self.lookup(name)
        load[name] || raise("Could not find asset #{name} in manifest")
      end
    end
end