# frozen_string_literal: true
class Upload
  class Processor
    def self.perform(upload)
      project = Project.find_by!(name: upload.project_name)
      upload.body.each { |text| Text.create(project: project, body: text['text'], context: text['context']) }
    end
  end
end
