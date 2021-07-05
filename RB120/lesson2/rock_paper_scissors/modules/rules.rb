module Rules
  RPS = {
          'rock' => ['scissors'], 'paper' => ['rock'], 'scissors' => ['paper']
        }.freeze

  LS = {
         'rock'     => ['scissors', 'lizard'],
         'paper'    => ['rock', 'spock'],
         'scissors' => ['paper', 'lizard'],
         'lizard'   => ['paper', 'spock'],
         'spock'    => ['scissors', 'rock']
       }.freeze

  ACCESSOR = { 'rps' => RPS, 'ls' => LS }.freeze
end
