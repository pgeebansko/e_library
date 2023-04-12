from rest_framework import serializers
from .models import Theme, Subject, QuestionText, QuestionItem, TestsSettings

"""" Сериализатори за тестови въпроси """


# опции/отговори към въпроси
class QuestionItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = QuestionItem
        fields = "__all__"


# въпроси - списък
class QuestionTextSerializer(serializers.ModelSerializer):
    options = QuestionItemSerializer(many=True)

    class Meta:
        model = QuestionText
        fields = '__all__'


# въпроси - обновяваане на картинка
class QuestionFileSerializer(serializers.ModelSerializer):
    class Meta:
        model = QuestionText
        fields = ('id', 'picture')

    def create(self, validated_data):
        image = validated_data.get('picture')
        item = QuestionText.objects.update_or_create(id=validated_data.get("id"), defaults={'picture': image})
        return item


# Въпрос - запазване на тялото на въпроса без картинката
class QuestionSaveTextSerializer(serializers.ModelSerializer):
    ids = serializers.IntegerField()

    class Meta:
        model = QuestionText
        fields = ('id', 'ids', 'text', 'type', 'level')

    def create(self, validated_data):
        i = validated_data.get('ids')
        text = validated_data.get('text')
        type_q = validated_data.get('type')
        level_q = validated_data.get('level')

        test = QuestionText.objects.update_or_create(
            id=i,
            defaults={'text': text, 'type': type_q, 'level': level_q})
        return test


# Въпрос - запазване на опциите към въпроса
class QuestionSaveItemsSerializer(serializers.ModelSerializer):
    ids = serializers.IntegerField()

    class Meta:
        model = QuestionItem
        fields = ('id', 'ids', 'task', 'leading_char', 'text', 'value', 'value_name', 'checked')

    def create(self, validated_data):
        i = validated_data.get('ids')
        task = validated_data.get('task')
        leading_char = validated_data.get('leading_char')
        text = validated_data.get('text')
        value = validated_data.get('value')
        value_name = validated_data.get('value_name')
        checked = validated_data.get('checked')
        option = QuestionItem.objects.update_or_create(
            id=i,
            defaults={'task': task, 'leading_char': leading_char, 'text': text, 'value': value,
                      'value_name': value_name, 'checked': checked})
        print('test=', option)
        return option


# Сериализатор Тема
class ThemeSerializer(serializers.ModelSerializer):
    questions = QuestionTextSerializer(many=True)

    class Meta:
        model = Theme
        fields = "__all__"


# Сериализатор Предмет
class SubjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = Subject
        fields = "__all__"


# Сериализатор Параметри
class SettingsSerializer(serializers.ModelSerializer):
    class Meta:
        model = TestsSettings
        fields = "__all__"
