require 'json'
json_sample2='[
{ "id": 1, "title": "heading1", "heading_level": 0 },
{ "id": 2, "title": "heading2", "heading_level": 3 },
{ "id": 3, "title": "heading3", "heading_level": 4 },
{ "id": 4, "title": "heading4", "heading_level": 1 },
{ "id": 5, "title": "heading5", "heading_level": 0 },
{ "id": 1, "title": "heading1", "heading_level": 0 },
{ "id": 2, "title": "heading2", "heading_level": 3 },
{ "id": 3, "title": "heading3", "heading_level": 4 },
{ "id": 4, "title": "heading4", "heading_level": 1 },
{ "id": 5, "title": "heading5", "heading_level": 0 }
]'
json_sample='[
{ "id" : 1, "title": "heading1", "heading_level" : 0 },
{ "id" : 2, "title": "heading2", "heading_level" : 2 },
{ "id" : 3, "title": "heading3", "heading_level" : 1 },
{ "id" : 4, "title": "heading4", "heading_level" : 1 }

]'
data_hash = JSON.parse(json_sample1)
countersHashmap = {
    "0" => 1,
    "1" => 1,
    "2" => 1,
    "3" => 1,
    "4" => 1
}
lastLevel = -1
data_hash.each do |record|
  tabs = "   " * record['heading_level']
  if lastLevel == record['heading_level']

    countersHashmap[record['heading_level']] += 1
  elsif lastLevel < record['heading_level']
    (record['heading_level'] .. countersHashmap.size).each do |level|
      countersHashmap[level] = 1
    end

  elsif lastLevel > record['heading_level']
    countersHashmap[record['heading_level']] += 1
  end
  link =[]
    (0 .. record['heading_level']).each do |level|
      link << countersHashmap[level].to_s + '.'
    end
    lastLevel = record['heading_level']
    puts "#{tabs}#{link.join().to_s}#{record['title']}\n"
end
