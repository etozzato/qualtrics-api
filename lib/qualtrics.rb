require "qualtrics/version"
require "resource_kit"
require "kartograph"

module Qualtrics
  autoload :Client,                 'qualtrics/client'

  # Models
  autoload :BaseModel,              'qualtrics/models/base_model'
  autoload :Organization,           'qualtrics/models/organization'
  autoload :Survey,                 'qualtrics/models/survey'

  # Resources
  autoload :OrganizationResource,   'qualtrics/resources/organization_resource'
  autoload :SurveyResource,         'qualtrics/resources/survey_resource'

  # JSON Maps
  autoload :OrganizationMapping,    'qualtrics/mappings/organization_mapping'
  autoload :SurveyMapping,          'qualtrics/mappings/survey_mapping'
end
