# Типове въпроси

TYPE1 = 1
TYPE2 = 2
TYPE3 = 3
TYPE4 = 4
TYPE5 = 5
TASK_TYPE = [
    (TYPE1, 'затворен тип без картинка'),
    (TYPE2, 'затворен тип с картинка'),
    (TYPE3, 'съпоставяне ляво --> дясно'),
    (TYPE4, 'съпоставяне картинка --> опции'),
    (TYPE5, 'отворен отговор'),
]

# Нива по Блум
LEVEL1 = 1
LEVEL2 = 2
LEVEL3 = 3
LEVEL4 = 4
LEVEL_TYPE = [
    (LEVEL1, 'знание'),
    (LEVEL2, 'разбиране'),
    (LEVEL3, 'приложение'),
    (LEVEL4, 'анализ'),
]


class DataMixin:
    def get_user_context(self, **kwargs):
        context = kwargs
        return context


