{
    den.aspects.kappashell = {
        homeManager = {
            xdg.configFile."kappashell/config.yaml" = {
                text = ''
# Kappashell Example configuration file
# Remove this line to remove the warning!
# You can attach widgets to any side of the screen. Valid locations for widgets are:
# top, bottom, left, or right. You can chooce any combination of these.
bars:
  left:
    # You can have widgets at the start (top or left, depending on the side of the monitor)
    # the middle 
    # or the end (bottom, or right, depending on the side of the monitor)
    start:
      # Each widget declaration has a type and a config. See the wiki for a complete list of options!
      - type: "logo"
        config: 
          icon: "nix-snowflake-white"
          # Most options have a default value. Try removing this line, and the widget will still work.
          size: 32
      - type: "button"
        config:
          action_type: "action"
          action: "debug"
          icon: "utilities-terminal-symbolic"
          size: 24
      - type: "clients"
        config: {}
    middle:
      - type: "client"
        config: {}
    end:
      - type: "tray"
        config: {}
      - type: "indicators"
        config: {}
      - type: "clock"
        config:
          24hour: true
      - type: "button"
        config:
          action_type: "action"
          icon: "system-shutdown-symbolic"
          size: 24
          action: "popup open power bottom"
  top:
    middle:
      - type: "region"
        config:
          size: 1000
          action_type: "action"
          action: "popup open main top"
  bottom:
    middle:
      - type: "region"
        config:
          size: 1000
          action_type: "action"
          action: "popup open runner bottom"
popups:
  power:
    type: "power"
  runner:
    type: "runner"
  main:
    type: "meta"
    config:
      - title: "Network"
        icon: "system-run-symbolic"
        popup:
          type: "meta"
          config:
            - title: "Wifi"
              icon: "system-run-symbolic"
              popup:
                type: "wifi"
            - title: "Ethernet"
              icon: "system-run-symbolic"
              popup:
                type: "wlan"
      - title: "Bluetooth"
        icon: "system-run-symbolic"
        popup:
          type: "bluetooth"
      - title: "Today"
        icon: "system-run-symbolic"
        popup:
          type: "meta"
          config:
            - title: "Clock"
              icon: "system-run-symbolic"
              popup:
                type: "clock"
            - title: "Calendar"
              icon: "system-run-symbolic"
              popup:
                type: "calendar"
      - title: "Battery"
        icon: "system-run-symbolic"
        popup:
          type: "battery"
      - title: "Music"
        icon: "system-run-symbolic"
        popup:
          type: "music"
                '';
            };
        };
    };
}
