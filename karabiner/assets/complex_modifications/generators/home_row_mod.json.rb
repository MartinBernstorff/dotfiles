#!/usr/bin/env ruby

require 'json'

def main
  puts JSON.pretty_generate(
    "title" => "@ Home Home Row Keys for Modifiers (using if_alone)",
    "maintainers" => ["@m_bernstorff"],
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
          generate_hold_modifier_only("semicolon", "right_shift"),
          # generate_hold_modifier_only("quote", "right_control"),
        ],
      },
      {
        "description" => "Disable left modifier cluster",
        "manipulators" => [
          generate_disable_key("left_shift"),
          generate_disable_key("left_control"),
          generate_disable_key("left_option"),
          generate_disable_key("left_command"),
        ],
      },
    ],
  )
end

def generate_disable_key(key)
  {
    "description" => "Hold #{key.split(/ |\_/).map(&:capitalize).join(" ")}",
    "type" => "basic",
    "from" => {
      "key_code" => key,
    },
    "to" => {
      "key_code" => "vk_none",
    },
  }
end

def generate_hold_modifier_and_if_alone(input, hold_modifier, alone_key_code)
  {
    # "parameters" => basic_parameters(),
    "parameters" => {
      'basic.to_if_held_down_threshold_milliseconds' => 80, # Modifier if > X
    },
    "description" => "Hold #{input.split(/ |\_/).map(&:capitalize).join(" ")} ⟶ #{hold_modifier.split(/ |\_/).map(&:capitalize).join(" ")}",
    "type" => "basic",
    "from" => {
      "key_code" => input,
      "modifiers" => { "optional" => ["any"] }
    },
    "to_if_held_down" => [
      {
        "key_code" => hold_modifier,
        "halt" => true
      }
    ],
    "to_after_key_up" => [
      {
        "key_code" => alone_key_code,
      }
    ],
  }
end

def generate_hold_modifier_only(input, hold_modifier)
  generate_hold_modifier_and_if_alone(input, hold_modifier, input)
end

main()
