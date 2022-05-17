module Qualtrics::API
  class SurveyMapping
    include Kartograph::DSL

    kartograph do
      mapping Survey
      root_key singular: "result", plural: "elements", scopes: [:read]

      property :name,       scopes: [:read, :update], optional: true
      property :is_active,  scopes: [:read, :update], key: "isActive", optional: true
      property :expiration, scopes: [:read, :update], optional: true do
        mapping Survey::Expiration

        property :start_date, scopes: [:read, :update], key: "startDate"
        property :end_date,   scopes: [:read, :update], key: "endDate"
      end

      scoped :read do
        property :name
        property :survey_id,          key: "id"
        property :owner_id,           key: "ownerId"
        property :organization_id,    key: "organizationId"
        property :creation_date,      key: "creationDate"
        property :last_modified,      key: "lastModified"
        property :flow
        property :embedded_data,      key: "embeddedData"
        property :response_counts,    key: "responseCounts"
        property :questions
        property :blocks
        property :export_column_map,  key: "exportColumnMap"
      end
    end
  end
end
