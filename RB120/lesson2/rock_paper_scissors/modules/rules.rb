module Rules
  RPS_RULES = {
                'rock' => ['scissors'], 'paper' => ['rock'], 'scissors' => ['paper']
              }.freeze

  LS_RULES = {
               'rock'     => ['scissors', 'lizard'],
               'paper'    => ['rock', 'spock'],
               'scissors' => ['paper', 'lizard'],
               'lizard'   => ['paper', 'spock'],
               'spock'    => ['scissors', 'rock']
             }.freeze

  RULES = { 'rps' => RPS_RULES, 'ls' => LS_RULES }.freeze
end
