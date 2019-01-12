#!/usr/bin/env ruby

compile '/index.adoc' do
  filter :asciidoctor
  layout '/default.*'
  write '/index.html'
end

compile '/**/*.html' do
  layout '/default.*'
  write item.identifier.without_ext + '/index.html'
end

# This is an example rule that matches Markdown (.md) files, and filters them
# using the :kramdown filter. It is commented out by default, because kramdown
# is not bundled with Nanoc or Ruby.
#
compile '/**/*.adoc' do
  filter :asciidoctor
  layout '/default.*'
  write item.identifier.without_ext + '/index.html'
end

# Nothing special to do with images / javascript / asset
# Just copy it to public directory
compile '/images/*/' do
end

compile '/**/*' do
  write item.identifier.to_s
end

route '/images/*' do
  item.identifier.chop + '.' + item[:extension]
end

layout '/**/*', :erb
