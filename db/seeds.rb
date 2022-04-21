User.destroy_all
Fact.destroy_all

Obeng = User.create( username: 'Obeng', password: '123456' )
fact_1 = Fact.create( fact: 'Obeng likes to eat Gobe everyday.', likes: 1, user_id: 1 )
