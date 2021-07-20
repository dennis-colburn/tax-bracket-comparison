module Util
  module State
    STATE_CODES = {
      "Alabama" => "AL",
      "Alaska" => "AK",
      "Arizona" => "AZ",
      "Arkansas" => "AR",
      "Armed Forces Africa/Canada/Europe/Middle East" => "AE",
      "Armed Forces Americas" => "AA",
      "Armed Forces Pacific" => "AP",
      "California" => "CA",
      "Colorado" => "CO",
      "Connecticut" => "CT",
      "Delaware" => "DE",
      "Florida" => "FL",
      "Georgia" => "GA",
      "Hawaii" => "HI",
      "Idaho" => "ID",
      "Illinois" => "IL",
      "Indiana" => "IN",
      "Iowa" => "IA",
      "Kansas" => "KS",
      "Kentucky" => "KY",
      "Louisiana" => "LA",
      "Maine" => "ME",
      "Maryland" => "MD",
      "Massachusetts" => "MA",
      "Michigan" => "MI",
      "Minnesota" => "MN",
      "Mississippi" => "MS",
      "Missouri" => "MO",
      "Montana" => "MT",
      "Nebraska" => "NE",
      "Nevada" => "NV",
      "New Hampshire" => "NH",
      "New Jersey" => "NJ",
      "New Mexico" => "NM",
      "New York" => "NY",
      "North Carolina" => "NC",
      "North Dakota" => "ND",
      "Ohio" => "OH",
      "Oklahoma" => "OK",
      "Oregon" => "OR",
      "Pennsylvania" => "PA",
      "Rhode Island" => "RI",
      "South Carolina" => "SC",
      "South Dakota" => "SD",
      "Tennessee" => "TN",
      "Texas" => "TX",
      "Utah" => "UT",
      "Vermont" => "VT",
      "Virginia" => "VA",
      "Washington" => "WA",
      "West Virginia" => "WV",
      "Wisconsin" => "WI",
      "Wyoming" => "WY",
      "District of Columbia" => "DC",
      "American Samoa" => "AS",
      "Guam" => "GU",
      "Northern Mariana Islands" => "MP",
      "Puerto Rico" => "PR",
      "U.S. Virgin Islands" => "VI"
    }.freeze

    def state_code(state_name)
      State.state_code(state_name)
    end

    # These class methods don't use instance data.
    # So why not expose them directly without having to import them
    def self.state_code(state_name)
      # TODO: this method should know nothing about Plaid.
      # Caller should not call it if state is nil
      return if state_name.nil? # Plaid may return blank state

      raise ArgumentError unless state_name.is_a?(String)

      STATE_CODES.fetch(state_name)
    end
  end
end