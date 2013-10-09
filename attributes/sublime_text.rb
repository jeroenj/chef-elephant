default[:elephant][:sublime_text][:version] = '2.0.2'
default[:elephant][:sublime_text][:url] = "http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%20#{node[:elephant][:sublime_text][:version]}.dmg"
default[:elephant][:sublime_text][:checksum] = '14fba173566d4415f1881a38ad98cf22144f1f63'

default[:elephant][:sublime_text] = {
  :extensions => {
    'Ruby' => %w[Cheffile Vagrantfile Procfile.dev],
    'Sass' => %w[sass],
    'SCSS' => %w[scss],
    'XML' => %w[xml xsd xslt svg terminal]
  },
  :packages => [
    {'name' => 'CoffeeScript', 'source' => 'https://github.com/Xavura/CoffeeScript-Sublime-Plugin'},
    # {'name' => 'CSV', 'source' => 'https://github.com/ericmartel/Sublime-Text-2-CSV-Plugin'},
    # {'name' => 'ERB Insert and Toggle Commands', 'source' => 'https://github.com/eddorre/SublimeERB'},
    # {'name' => 'FileDiffs', 'source' => 'https://github.com/spape/SublimeFileDiffs'},
    {'name' => 'Git', 'source' => 'https://github.com/kemayo/sublime-text-2-git'},
    {'name' => 'GitGutter', 'source' => 'https://github.com/jisaacks/GitGutter'},
    # {'name' => 'Haml', 'source' => 'https://github.com/phuibonhoa/handcrafted-haml-textmate-bundle'},
      # {'name' => 'HTML2HAML', 'source' => 'https://github.com/pavelpachkovskij/sublime-html-to-haml'},
    # {'name' => 'Indent XML', 'source' => 'https://github.com/alek-sys/sublimetext_indentxml'},
      # {'name' => 'JS2Coffee', 'source' => 'https://github.com/nibblebot/sublime-js2coffee'},
    # {'name' => 'LESS', 'source' => 'https://github.com/danro/LESS-sublime'},
    {'name' => 'Markdown Preview', 'source' => 'https://github.com/revolunet/sublimetext-markdown-preview'},
    # {'name' => 'Pretty JSON', 'source' => 'https://github.com/dzhibas/SublimePrettyJson'},
    # {'name' => 'Rails Related Files', 'source' => 'https://github.com/luqman/SublimeText2RailsRelatedFiles'},
    {'name' => 'RSpec', 'source' => 'https://github.com/SublimeText/RSpec'},
    {'name' => 'Ruby 1.9 Hash Converter', 'source' => 'https://github.com/iltempo/sublime-text-2-hash-syntax'},
    # {'name' => 'RubyMotion Autocomplete', 'source' => 'https://github.com/diemer/RubyMotionSublimeCompletions'},
    # {'name' => 'RubyMotionBuilder', 'source' => 'https://github.com/haraken3/SublimeRubyMotionBuilder'},
    {'name' => 'RubyTest', 'source' => 'https://github.com/maltize/sublime-text-2-ruby-tests'},
    {'name' => 'Sass', 'source' => 'https://github.com/nathos/sass-textmate-bundle'},
    {'name' => 'SCSS', 'source' => 'https://github.com/kuroir/SCSS.tmbundle'},
    # {'name' => 'Simple Rails Navigator', 'source' => 'https://github.com/noklesta/SublimeRailsNav'},
    {'name' => 'sublime_text_alternative_autocompletion', 'source' => 'https://github.com/alexstaubo/sublime_text_alternative_autocompletion'},
    # {'name' => 'Theme - Soda', 'source' => 'https://github.com/buymeasoda/soda-theme'},
    {'name' => 'Toggle Symbol to String', 'source' => 'https://github.com/zoomix/SublimeToggleSymbol'},
    {'name' => 'ToggleQuotes', 'source' => 'https://github.com/spadgos/sublime-ToggleQuotes'}
  ]
}

# memory leak
