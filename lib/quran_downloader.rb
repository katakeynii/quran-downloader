module QuranDownloader
  require 'open-uri'

  # Liste complète des 114 sourates du Coran
  SURAHS = [
    { name: "Al-Fatihah", number: "001" },
    { name: "Al-Baqarah", number: "002" },
    { name: "Al-Imran", number: "003" },
    { name: "An-Nisa", number: "004" },
    { name: "Al-Maidah", number: "005" },
    { name: "Al-Anam", number: "006" },
    { name: "Al-Araf", number: "007" },
    { name: "Al-Anfal", number: "008" },
    { name: "At-Tawbah", number: "009" },
    { name: "Yunus", number: "010" },
    { name: "Hud", number: "011" },
    { name: "Yusuf", number: "012" },
    { name: "Ar-Rad", number: "013" },
    { name: "Ibrahim", number: "014" },
    { name: "Al-Hijr", number: "015" },
    { name: "An-Nahl", number: "016" },
    { name: "Al-Isra", number: "017" },
    { name: "Al-Kahf", number: "018" },
    { name: "Maryam", number: "019" },
    { name: "Ta-Ha", number: "020" },
    { name: "Al-Anbiya", number: "021" },
    { name: "Al-Hajj", number: "022" },
    { name: "Al-Muminun", number: "023" },
    { name: "An-Nur", number: "024" },
    { name: "Al-Furqan", number: "025" },
    { name: "Ash-Shuara", number: "026" },
    { name: "An-Naml", number: "027" },
    { name: "Al-Qasas", number: "028" },
    { name: "Al-Ankabut", number: "029" },
    { name: "Ar-Rum", number: "030" },
    { name: "Luqman", number: "031" },
    { name: "As-Sajdah", number: "032" },
    { name: "Al-Ahzab", number: "033" },
    { name: "Saba", number: "034" },
    { name: "Fatir", number: "035" },
    { name: "Ya-Sin", number: "036" },
    { name: "As-Saffat", number: "037" },
    { name: "Sad", number: "038" },
    { name: "Az-Zumar", number: "039" },
    { name: "Ghafir", number: "040" },
    { name: "Fussilat", number: "041" },
    { name: "Ash-Shura", number: "042" },
    { name: "Az-Zukhruf", number: "043" },
    { name: "Ad-Dukhan", number: "044" },
    { name: "Al-Jathiyah", number: "045" },
    { name: "Al-Ahqaf", number: "046" },
    { name: "Muhammad", number: "047" },
    { name: "Al-Fath", number: "048" },
    { name: "Al-Hujurat", number: "049" },
    { name: "Qaf", number: "050" },
    { name: "Adh-Dhariyat", number: "051" },
    { name: "At-Tur", number: "052" },
    { name: "An-Najm", number: "053" },
    { name: "Al-Qamar", number: "054" },
    { name: "Ar-Rahman", number: "055" },
    { name: "Al-Waqiah", number: "056" },
    { name: "Al-Hadid", number: "057" },
    { name: "Al-Mujadilah", number: "058" },
    { name: "Al-Hashr", number: "059" },
    { name: "Al-Mumtahanah", number: "060" },
    { name: "As-Saff", number: "061" },
    { name: "Al-Jumuah", number: "062" },
    { name: "Al-Munafiqun", number: "063" },
    { name: "At-Taghabun", number: "064" },
    { name: "At-Talaq", number: "065" },
    { name: "At-Tahrim", number: "066" },
    { name: "Al-Mulk", number: "067" },
    { name: "Al-Qalam", number: "068" },
    { name: "Al-Haqqah", number: "069" },
    { name: "Al-Maarij", number: "070" },
    { name: "Nuh", number: "071" },
    { name: "Al-Jinn", number: "072" },
    { name: "Al-Muzzammil", number: "073" },
    { name: "Al-Muddaththir", number: "074" },
    { name: "Al-Qiyamah", number: "075" },
    { name: "Al-Insan", number: "076" },
    { name: "Al-Mursalat", number: "077" },
    { name: "An-Naba", number: "078" },
    { name: "An-Naziat", number: "079" },
    { name: "Abasa", number: "080" },
    { name: "At-Takwir", number: "081" },
    { name: "Al-Infitar", number: "082" },
    { name: "Al-Mutaffifin", number: "083" },
    { name: "Al-Inshiqaq", number: "084" },
    { name: "Al-Buruj", number: "085" },
    { name: "At-Tariq", number: "086" },
    { name: "Al-Ala", number: "087" },
    { name: "Al-Ghashiyah", number: "088" },
    { name: "Al-Fajr", number: "089" },
    { name: "Al-Balad", number: "090" },
    { name: "Ash-Shams", number: "091" },
    { name: "Al-Lail", number: "092" },
    { name: "Ad-Duha", number: "093" },
    { name: "Ash-Sharh", number: "094" },
    { name: "At-Tin", number: "095" },
    { name: "Al-Alaq", number: "096" },
    { name: "Al-Qadr", number: "097" },
    { name: "Al-Bayyinah", number: "098" },
    { name: "Az-Zalzalah", number: "099" },
    { name: "Al-Adiyat", number: "100" },
    { name: "Al-Qariah", number: "101" },
    { name: "At-Takathur", number: "102" },
    { name: "Al-Asr", number: "103" },
    { name: "Al-Humazah", number: "104" },
    { name: "Al-Fil", number: "105" },
    { name: "Quraish", number: "106" },
    { name: "Al-Maun", number: "107" },
    { name: "Al-Kawthar", number: "108" },
    { name: "Al-Kafirun", number: "109" },
    { name: "An-Nasr", number: "110" },
    { name: "Al-Masad", number: "111" },
    { name: "Al-Ikhlas", number: "112" },
    { name: "Al-Falaq", number: "113" },
    { name: "An-Nas", number: "114" }
  ]

  def self.download_quran(mp3_url, reciter_name)
    puts "Téléchargement du Coran..."
    
    # Créer le dossier downloads s'il n'existe pas
    downloads_dir = "downloads"
    Dir.mkdir(downloads_dir) unless Dir.exist?(downloads_dir)
    
    # Créer le dossier du récitateur
    reciter_dir = File.join(downloads_dir, reciter_name)
    Dir.mkdir(reciter_dir) unless Dir.exist?(reciter_dir)
    
    SURAHS.each do |sura|
      download_mp3(mp3_url, sura, reciter_dir)
    end

    puts "Téléchargement du Coran terminé"
    puts "Les fichiers MP3 ont été enregistrés dans #{reciter_dir}"
  end
  
  def self.download_mp3(base_url, sura, output_dir)
    # Construire l'URL et le chemin de sortie
    url = "#{base_url}/#{sura[:number]}.mp3"
    output_path = File.join(output_dir, "#{sura[:name]}.mp3")
    puts "================"
    puts "Téléchargement du MP3 : #{url}"
    puts "================"
    begin
      URI.open(url) do |mp3|
        File.open(output_path, 'wb') do |file|
          file.write(mp3.read)
        end
      end
      puts "MP3 téléchargé avec succès dans #{output_path}"
    rescue OpenURI::HTTPError => e
      puts "Erreur HTTP lors du téléchargement : #{e.message}"
    rescue StandardError => e
      puts "Échec du téléchargement du MP3 : #{e.message}"
    end
  end
end
