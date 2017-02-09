class Translation < ActiveRecord::Base
  #require 'iconv'
  validate :translation_validate
  def translation_validate
    errors[:base] << ("Language should not be blank") if self.locale.blank?
    errors[:base] << ("Key Name should not be blank") if self.key.blank?
    errors[:base] << ("Value should not be blank") if self.value.blank?
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      lan = row.dup
      lan.delete("key")
      self.create_languages(row['key'],lan)
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
  
   def self.create_languages(key,laguage={})
     laguage.each_pair do |language,value|
       translation = where(:key => key,:locale => language).first || new(:key => key,:locale => language,:value =>value)
       translation.value = value
       translation.save
     end
   end
end
