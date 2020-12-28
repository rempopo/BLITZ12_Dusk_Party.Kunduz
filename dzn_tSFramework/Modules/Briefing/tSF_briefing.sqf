//     tSF Briefing
// Do not modify this part
#define BRIEFING		_briefing = [];
#define TOPIC(NAME) 	_briefing pushBack ["Diary", [ NAME,
#define END			]];
#define ADD_TOPICS	for "_i" from (count _briefing) to 0 step -1 do {player createDiaryRecord (_briefing select _i);};
#define TAGS(X) tSF_MissionTags = X ;
//
//
// Mission tags
TAGS(["SPECOPS","INFANTRY"])

// Briefing goes here

BRIEFING

TOPIC("I. Обстановка:")
"Талибан продолжает свою активность в провинции. Мы получили информацию, что недавно сюда прибыла крупная партия оружия и поставки все еще идет. 
<br />
<br />Сегодня ночью должна состоятся очередная встреча между талибами и местными коллаборационистами, и это отличный шанс получить больше информации и накрыть сам склад."
END

TOPIC("А. Враждебные силы:")
"Талибан, легкая пехота"
END

TOPIC("Б. Дружественные силы:")
"Спецназ ACR:
<br />  - Dýka, 9 человек
<br />  - Břitva, 9 человек
<br />"
END

TOPIC("II. Задание:")
"1. Зачистить Obj.Pivo
<br />2. Найти информацию о местоположении склада
<br />3. Найти склад и уничтожить ящики с оружием/боеприпасами
<br />"
END

TOPIC("III. Выполнение:")
"Первым делом зачистите Obj.Pivo и осмотритесь в поисках информации. В теории у местных должны быть какие-то карты с точками доставки - найдите их.
<br />
<br />Если вы сможете обнаружить местоположение склада - атакуйте немедленно и взорвите там все к чертям.
<br />
<br />Постарайтесь не уничтожить встреченные автомобили, они могут вам понадобиться."
END

TOPIC("IV. Поддержка:")
"Нет"
END

TOPIC("V. Сигналы:")
"PL NET 50
<br />1'1 - SR CH 1
<br />1'2 - SR CH 2"
END

TOPIC("VI. Замечания:")
"Powered by Tactical Shift Framework"
END

if ((serverCommandAvailable '#logout') || !(isMultiplayer) || isServer) then {
TOPIC("VII. Замечания для GSO:")
"- Нет"
END
};

ADD_TOPICS