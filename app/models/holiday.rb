class Holiday < ApplicationRecord

    def self.import(file)
        spreadsheet = open_spreadsheet(file)
        header = spreadsheet.row(1)
        (2..spreadsheet.last_row).each do |i|
          row = Hash[[header, spreadsheet.row(i)].transpose]
          holiday = find_by_id(row["id"]) || new
          holiday.attributes = row.to_hash.slice(*Holiday.attribute_names())
          holiday.save!
        end
      end
      
      def self.open_spreadsheet(file)
        case File.extname(file.original_filename)
          # ...
          # when '.xlsx' then Roo::Excelx.new(file.path, nil, :ignore)
          when ".xlsx" then Roo::Excelx.new(file.path)
          # ...
        end
      end
end
