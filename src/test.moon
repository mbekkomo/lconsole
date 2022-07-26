console = require 'lconsole'

choice = console.choice 'Are u going to run this script? '

os.exit! if not choice

print('')

name = console.input 'What\'s ur name? '

print('')

switch name\lower!
  when 'gay'
    console.alert '>:('
  when 'sus'
    console.warn ':sus:'
  else
    console.log "Hi #{name}"

