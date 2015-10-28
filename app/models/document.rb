class Document < ActiveRecord::Base
  require 'csv'
  #attr_accessible :date, :category, :employee, :name, :employee_address, :expense_description, :pre_tax_amount, :tax_name, :tax_amount
  
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |document|
        csv << document.attributes.values_at(*column_names)
      end
    end
  end
  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Member.create(date: row["date"], category: row["category"], employee_name: row["employee name"],
                    employee_address: row["employee address"], 
                    expense_description: row["expense description"], pre_tax_amount: row["pre-tax amount"], 
                    tax_name: row["tax name"], tax_amount: row["tax amount"])
                    
    end
  end
end