# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TodoApi.Repo.insert!(%TodoApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

todos = [
  [
    "Optimize Home Network",
    "Perform a network analysis to find weak spots and bottlenecks. Update QoS settings to prioritize work devices and limit bandwidth for entertainment devices"
  ],
  ["Finish the book", "Remember the illustrations"],
  [
    "Clean AI-powered Vacuum",
    "Open up the robotic vacuum cleaner, clean the dustbin, and replace filters. Also, update the device's mapping algorithm to better navigate around new furniture"
  ],
  [
    "Assemble Drone Fleet",
    "Update the firmware on your surveillance drones and run a test flight in the yard. Ensure all cameras and sensors are functional"
  ],
  [
    "Synthesize Nutrients",
    "Use your food synthesizer to create a balanced meal plan for the week. Double-check nutrient ratios and run a test meal to verify taste and consistency"
  ]
]

todos
|> Enum.each(fn
  [title, content] -> TodoApi.Todos.create_todo(%{"title" => title, "content" => content})
end)
