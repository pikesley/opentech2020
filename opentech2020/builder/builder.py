from os import listdir
from shutil import copytree, rmtree


slides = ''
template = open('builder/slide.html').read()
for slide in sorted(listdir('slides')):
  slides += template.replace('FILENAME', slide)

rmtree('reveal.js/slides')
copytree('slides', 'reveal.js/slides')

index = open('reveal.js/index.html').read()

head = index.split('<!-- SLIDES BEGIN -->')[0] + '<!-- SLIDES BEGIN -->'
tail =  '<!-- SLIDES END -->' + index.split('<!-- SLIDES END -->')[1]

content = head + slides + tail

with open('reveal.js/index.html', 'w') as index:
  index.write(content)
