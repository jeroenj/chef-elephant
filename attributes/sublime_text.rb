default[:elephant][:sublime_text][:version] = '2.0.2'
default[:elephant][:sublime_text][:url] = "http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%20#{node[:elephant][:sublime_text][:version]}.dmg"
default[:elephant][:sublime_text][:checksum] = '14fba173566d4415f1881a38ad98cf22144f1f63'

default[:elephant][:sublime_text] = {
  :extensions => {
    'JSON' => %w[Berksfile.lock],
    'Ruby' => %w[Berksfile Cheffile Vagrantfile Procfile.dev rabl ru],
    'Sass' => %w[sass],
    'SCSS' => %w[scss],
    'XML' => %w[xml xsd xslt svg terminal plist],
    'YAML' => %w[yml.example]
  },
  :packages => [
    {'name' => 'CoffeeScript', 'source' => 'https://github.com/Xavura/CoffeeScript-Sublime-Plugin'},
    {'name' => 'CoffeeCompile', 'source' => 'https://github.com/surjikal/sublime-coffee-compile'},
    {'name' => 'FileDiffs', 'source' => 'https://github.com/spape/SublimeFileDiffs'},
    {'name' => 'Git', 'source' => 'https://github.com/kemayo/sublime-text-2-git'},
    {'name' => 'GitGutter', 'source' => 'https://github.com/jisaacks/GitGutter'},
    {'name' => 'HTML2HAML', 'source' => 'https://github.com/pavelpachkovskij/sublime-html-to-haml'},
    {'name' => 'Indent XML', 'source' => 'https://github.com/alek-sys/sublimetext_indentxml'},
    {'name' => 'JS2Coffee', 'source' => 'https://github.com/nibblebot/sublime-js2coffee'},
    {'name' => 'LESS', 'source' => 'https://github.com/danro/LESS-sublime'},
    {'name' => 'Markdown Preview', 'source' => 'https://github.com/revolunet/sublimetext-markdown-preview'},
    {'name' => 'Pretty JSON', 'source' => 'https://github.com/dzhibas/SublimePrettyJson'},
    {'name' => 'RSpec', 'source' => 'https://github.com/SublimeText/RSpec'},
    {'name' => 'Ruby 1.9 Hash Converter', 'source' => 'https://github.com/iltempo/sublime-text-2-hash-syntax'},
    {'name' => 'RubyMotionBuilder', 'source' => 'https://github.com/RubyMotionJP/SublimeRubyMotionBuilder'},
    {'name' => 'RubyTest', 'source' => 'https://github.com/maltize/sublime-text-2-ruby-tests'},
    {'name' => 'Sass', 'source' => 'https://github.com/nathos/sass-textmate-bundle'},
    {'name' => 'SCSS', 'source' => 'https://github.com/kuroir/SCSS.tmbundle'},
    {'name' => 'sublime_text_alternative_autocompletion', 'source' => 'https://github.com/alexstaubo/sublime_text_alternative_autocompletion'},
    {'name' => 'Toggle Symbol to String', 'source' => 'https://github.com/zoomix/SublimeToggleSymbol'},
    {'name' => 'ToggleQuotes', 'source' => 'https://github.com/spadgos/sublime-ToggleQuotes'}
  ]
}
