# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@tour = Tour.create([
                        {
                            title: 'Вінницькі фонтани. 1',
                            description: 'на Вінницькі фонтани. 1. Коротка программа "Тільки фонтани" - виїзд в 15:00 - 150 грн/1 ос.
                                           Запис по тел. 063-3627885, 067-5095100 Туристична агенція ELENA, Фастів,пл.Перемоги1.',
                            price: 290,
                            date: 2010-10-10,
                            cover: 'https://pp.vk.me/c633422/v633422037/2f328/PUKGPWVKZBo.jpg'
                        },
                        {
                            title: 'fff',
                            description: 'sfsdf',
                            price: 21,
                            date: 2011-11-01,
                            cover: 'https://pp.vk.me/c630830/v630830414/2aca9/grFqaRYYk4g.jpg'
                        }
                    ])
