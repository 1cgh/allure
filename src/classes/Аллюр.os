
#Область ОписаниеПеременных

Перем КаталогОтчета; // Каталог с отчетом Allure.

#КонецОбласти

#Область ПрограммныйИнтерфейс

Функция ТестовыеНаборы() Экспорт

	ФайлНаборов = "data/suites.json";
	ПолныйПуть = ОбъединитьПути(КаталогОтчета, ФайлНаборов);
	ЧтениеJSON = Новый ЧтениеJSON();
	ЧтениеJSON.ОткрытьФайл(ПолныйПуть, "UTF-8");
	Данные = ПрочитатьJSON(ЧтениеJSON, Истина);
	Возврат Данные;

КонецФункции

Функция ТестКейс(Идентификатор) Экспорт

	ФайлТестКейса = СтрШаблон("%1.json", Идентификатор);
	ПолныйПуть = ОбъединитьПути(КаталогОтчета, "data\test-cases", ФайлТестКейса);
	ЧтениеJSON = Новый ЧтениеJSON();
	ЧтениеJSON.ОткрытьФайл(ПолныйПуть, "UTF-8");
	Данные = ПрочитатьJSON(ЧтениеJSON, Истина);
	Возврат Данные;

КонецФункции

Функция ОписаниеВложения(Вложение) Экспорт

	Результат = Новый Структура();
	Результат.Вставить("Идентификатор", Вложение["uid"]);
	Результат.Вставить("ИмяФайла", Вложение["name"]);
	Результат.Вставить("Тип", Вложение["type"]);
	Результат.Вставить("Размер", Вложение["size"]);
	Результат.Вставить("ДвоичныеДанные", ДвоичныеДанныеВложения(Вложение["source"]));
	Возврат Результат;

КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура ПриСозданииОбъекта(пКаталогОтчета)

	КаталогОтчета = пКаталогОтчета;

КонецПроцедуры

Функция ДвоичныеДанныеВложения(ИмяФайла)

	ПолноеИмя = ОбъединитьПути(КаталогОтчета, "data\attachments", ИмяФайла);
	ДвоичныеДанные = Новый ДвоичныеДанные(ПолноеИмя);
	Возврат ДвоичныеДанные;

КонецФункции

#КонецОбласти
