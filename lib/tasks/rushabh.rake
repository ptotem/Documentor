task :upload_data, [:model_name, :src_dir_path, :attached_file_name] => :environment do |t, args|
  desc :"This is a  rake task to upload files using paperclip.Its has 3 arguments...first the model name second the path to directory where files to be uploaded are kept and third the paperclip attachment name"
  Dir.new(args[:src_dir_path]).entries.each do |e|
    if e!="." and e!=".."
      puts e

      @document=Document.find_by_name(e)

      if @document.nil?
        @document= Document.create!(:name => e)
      end
      Dir.new("#{args[:src_dir_path]}/#{e}").entries.each do |file|

        if !File.directory?(file)
          puts "Uploading #{file}"
          @x=args[:model_name].constantize.create!(args[:attached_file_name].to_sym => File.open("#{args[:src_dir_path]}/#{e}/#{file}"), :name => file, :document_id => @document.id)
          if args[:model_name]=="Page"
            @x.sequence_number=file.split(".")[0].to_i
            @x.save!
          end


        end
      end
    end
  end
end


task :populate_components, [:src_dir_path] => :environment do |t, args|
  require "spreadsheet"
Component.destroy_all
ComponentSpec.destroy_all
ComponentType.destroy_all
  book = Spreadsheet.open args[:src_dir_path]
  sheet1 = book.worksheet 0
  sheet1.each 1 do |row|
    @c_type=ComponentType.create!(:name => row[1])
    @c_type.save!
    (row.count-2).times do |i|
      @c_spec=ComponentSpec.create!(:name => row[i+2], :component_type_id => @c_type.id)
      @component=Component.create!(:name => "#{row[1]} - #{row[i+2]}")
#      @c_spec.save!
 #     @component.save!
    end


  end


end


task :populate_examples, [:src_dir_path] => :environment do |t, args|
  require "spreadsheet"
  puts "Deleting all existing examples/...."
  Example.destroy_all
  puts "Destroy Activity Complete !"

  puts "Now creating a superset"

  @sup_set=SuperSet.create!(:name => "SuperSet1")
  puts "Superset creation done"


  book = Spreadsheet.open args[:src_dir_path]+"/example_tree.xls"
  sheet1 = book.worksheet 0
  sheet1.each 1 do |row|
    @component=Component.find_by_name("#{row[0]} - #{row[2]}")

    if !@component.nil?

      5.times do |i|
        @ref_set=ReferenceSet.find_by_name("ref_set#{i+1}")
        if @ref_set.nil?
          @ref_set=ReferenceSet.create!(:name => "ref_set#{i+1}", :super_set_id => @sup_set.id)

        end
        puts "Uploading examples for #{@component.name} #{@ref_set.name}"

        @example=Example.new
        @example.reference_set_id=@ref_set.id
        @example.component_id=@component.id
        if row[1].downcase=="text"
          @example.is_image=false
          @example.text_content=row[i+3]

        else
          @example.is_image=true
          if !row[i+3].blank?
            @example.example_image=File.open("#{args[:src_dir_path]}/images/#{row[i+3]}")
          else
            @example.example_image=File.open("#{args[:src_dir_path]}/images/blank_signature.png")
          end

        end

        @example.save!
      end
    end


  end


end


task :populate_questions, [:src_file_path] => :environment do |t, args|
  desc :" rake task to populate questions"
  require "spreadsheet"
  book = Spreadsheet.open args[:src_file_path]
  sheet1 = book.worksheet 0
  @docket=Docket.first
  Question.destroy_all
  sheet1.each 2 do |row|

    puts "Using Question: #{row[1]}"
    @question=Question.create!(:docket_id => @docket.id, :statement => row[1], :optiona => row[2], :optionb => row[3], :optionc => row[4], :optiond => row[5],:optionacorrect=>false,:optionbcorrect=>false,:optionccorrect=>false,:optiondcorrect=>false)
    case row[6]
      when "A" then
        @question.optionacorrect=true
        @question.save!
      when "B" then
        @question.optionbcorrect=true
        @question.save!
      when "C" then
        @question.optionccorrect=true
        @question.save!
      when "D" then
        @question.optiondcorrect=true
        @question.save!
      else




    end


  end


end





