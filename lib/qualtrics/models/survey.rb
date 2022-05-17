module Qualtrics::API
  class Survey < BaseModel
    attribute :survey_id
    attribute :name
    attribute :owner_id
    attribute :organization_id
    attribute :creation_date
    attribute :last_modified
    attribute :is_active
    attribute :expiration
    attribute :questions
    attribute :export_column_map
    attribute :blocks
    attribute :flow
    attribute :embedded_data
    attribute :response_counts

    ##
    # Make the model serializeable by ActiveModelSerializer
    #
    # @return [OpenStruct]
    #
    def self.model_name
      OpenStruct.new(name: "Qualtrics::API::Survey",
                     klass: self,
                     singular: "qualtrics_survey",
                     plural: "qualtrics_surveys",
                     element: "survey",
                     human: "Survey",
                     collection: "qualtrics/surveys",
                     param_key: "qualtrics_surveys",
                     i18n_key: "qualtrics/surveys",
                     route_key: "qualtrics_surveys",
                     singular_route_key: "qualtrics_survey")
    end

    def created_at
      creation_date
    end

    def updated_at
      last_modified
    end
  end
end
