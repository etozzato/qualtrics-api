# Qualtrics Ruby API Wrapper

This is a wrapper for the [Qualtrics API](https://api.qualtrics.com) written in Ruby.

Original work by `Nick Hurst and Joel N`
`https://code.osu.edu/asctech/qualtrics-ruby-api-wrapper` `https://github.com/niedfelj/qualtrics`

## Endpoints added on this fork

- `mailing_lists.import_contacts`
- `mailing_lists.track_import`
- `distributions.create_links`
- `distributions.retrieve_link`
- `distributions.history`

- `mailing_lists.paginated`
- `surveys.paginated`

## Example / Use Case

An application that maintains a pool of survey participants needs to create a mailing list, import contacts, create and retrieve individual survey links.

```ruby
client = Qualtrics::API::Client.new(api_token: 'YOUR_TOKEN', data_center_id: 'YOUR_DATA_CENTER_ID')

library_id = 'XXXX'
directory_id = 'YYYY'
survey_id = 'ZZZZ'

mailing_list = Qualtrics::API::MailingList.new(library_id: library_id, name: 'MY LIST')
response = qq.mailing_lists.create(mailing_list)
mailing_list_id = response[:id]

contacts = []

contacts << Qualtrics::API::MailingList::Contact.new(
  first_name: 'Emanuele',
  last_name: 'Tozzato',
  email: 'etozzato@example.com',
  external_data_reference: 'tozz',
  unsubscribed: false
)
contacts << Qualtrics::API::MailingList::Contact.new(
  first_name: 'Franksi',
  last_name: 'Natra',
  email: 'fsinatra@example.com',
  external_data_reference: 'sina',
  unsubscribed: false
)
contacts << Qualtrics::API::MailingList::Contact.new(
  first_name: 'Pola',
  last_name: 'Roid',
  email: 'proid@example.com',
  external_data_reference: 'roid',
  unsubscribed: false
)

response = qq.mailing_lists.import_contacts(contacts, id: directory_id, mailing_list_id: mailing_list_id)
import_id = response[:id]

while (@percentComplete || 0) < 100
  sleep 5 # this could use an exponential back-off
  response = qq.mailing_lists.track_import(id: directory_id, mailing_list_id: mailing_list_id, import_id: import_id)
  puts "Percent complete: #{@percentComplete = response[:percentComplete]}"
end

response = qq.distributions.create_links(survey_id: survey_id, mailing_list_id: mailing_list_id)
distribution_id = response[:id]

sleep 3 # this might not be needed :)

response = qq.distributions.retrieve_links(id: distribution_id, surveyId: survey_id)
puts  response[:elements]
```

A "paginated" request is in fact a collection of resources and a cursor to the next page.

```ruby
client.surveys.paginated => OpenStruct.new(collection: [Qualtrics::API::Survey], next_page: String )
```
