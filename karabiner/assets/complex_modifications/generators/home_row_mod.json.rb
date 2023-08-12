#!/usr/bin/env ruby

require 'json'

def main
  puts JSON.pretty_generate(
    "title" => "@ Home Home Row Keys for Modifiers (using if_alone)",
    "maintainers" => ["eytanhanig"],
    # # Uncomment conditions to only apply modifications to internal apple keboards
    # "conditions" => [
    #   {
    #     "identifiers" => [
    #       {
    #         "is_built_in_keyboard" => true,
    #       },
    #       {
    #         "vendor_id" => 1452,
    #       },
    #     ],
    #     "type" => "device_if"
    #   }
    # ],
    "rules" => [
      {
        "description" => "Shift, Control, Option, Command ⟶  Home Row",
        "manipulators" => [
          # Left Hand
          generate_hold_modifier_only("a", "left_shift"),
          generate_hold_modifier_only("s", "left_control"),
          generate_hold_modifier_only("d", "left_option"),
          generate_hold_modifier_only("f", "left_command"),
          # Right Hand
          # generate_hold_modifier_only("j", "right_command"),
          # generate_hold_modifier_only("k", "right_option"),
          # generate_hold_modifier_only("l", "right_control"),
          generate_hold_modifier_only("æ", "right_shift"),
          # generate_hold_modifier_only("quote", "right_control"),
        ],
      },
    ],
  )
end

def generate_disable_key(key)
  {
    "description" => "Hold #{input.split(/ |\_/).map(&:capitalize).join(" ")} ⟶ #{hold_modifier.split(/ |\_/).map(&:capitalize).join(" ")}",
    "type" => "basic",
    "from" => {
      "key_code" => input,
      "modifiers" => { "optional" => ["any"] },
    },
    "to_delayed_action" => {
      "to_if_canceled" => [
        {
            "key_code" => alone_key_code
        }
      ]
    },
    "to_if_alone" => [
      {
        "key_code" => alone_key_code,
        "halt" => true
      }
    ],
    "to_if_held_down" => [
      {
        "key_code" => hold_modifier
      }
    ],
  }
end

def generate_hold_modifier_and_if_alone(input, hold_modifier, alone_key_code)
  {
    # "parameters" => basic_parameters(),
    "parameters" => {
      # 'basic.to_if_alone_timeout_milliseconds' => 300, # Key if < X and alone
      'basic.to_delayed_action_delay_milliseconds' => 70, # Key if < X 
      'basic.to_if_held_down_threshold_milliseconds' => 71, # Modifier if > X
      # 'basic.simultaneous_threshold_milliseconds' => 300, # Unsure what this does exactly.
    },
    "description" => "Hold #{input.split(/ |\_/).map(&:capitalize).join(" ")} ⟶ #{hold_modifier.split(/ |\_/).map(&:capitalize).join(" ")}",
    "type" => "basic",
    "from" => {
      "key_code" => input,
      "modifiers" => { "optional" => ["any"] },
    },
    "to_delayed_action" => {
      "to_if_canceled" => [
        {
            "key_code" => alone_key_code
        }
      ]
    },
    "to_if_alone" => [
      {
        "key_code" => alone_key_code,
        "halt" => true
      }
    ],
    "to_if_held_down" => [
      {
        "key_code" => hold_modifier
      }
    ],
  }
end

def generate_hold_modifier_only(input, hold_modifier)
  generate_hold_modifier_and_if_alone(input, hold_modifier, input)
end

main()
