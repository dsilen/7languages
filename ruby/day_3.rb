#!/usr/bin/env ruby

# Copy paste från boken
module ActAsCsv
    def self.included(base)
        base.extend ClassMethods
    end

    module ClassMethods
        def acts_as_csv
            include InstanceMethods
        end        
    end

    module InstanceMethods
        def read
            @csv_contents = []
            filename = self.class.to_s.downcase + '.txt'
             filename
            file = File.new(filename)
            @headers = file.gets.chomp.split(', ')

            file.each do |row|
                @csv_contents << row.chomp.split(', ')
            end
        end

        attr_accessor :headers, :csv_contents

        def initialize
            read
        end
    end
end

#class RubyCsv
#    include ActAsCsv
#    acts_as_csv
#end
#m = RubyCsv.new
#puts m.headers.inspect
#puts m.csv_contents.inspect

# tillagt
module ActAsCsv
    class CsvRow
        def initialize(headers, csv_content)
            @headers = headers
            @csv_content = csv_content
        end
        def method_missing name, *args
            propname = name.to_s
            idx = @headers.index propname
            @csv_content[idx]
        end
    end

    module InstanceMethods
        def each(&block)
            @csv_contents.each do |c|
                r = CsvRow.new(@headers,c)
                block.call r
            end
            nil
        end
    end
end

class RubyCsv
    include ActAsCsv
    acts_as_csv
end

m = RubyCsv.new
m.each {|x| p x.two}
