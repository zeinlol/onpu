import speech_recognition as sr
import os
import sys
import webbrowser
import pyttsx3
import pyaudio

def talk(words):
	#print(words)
	#os.system("say " + words)
	engine = pyttsx3.init()
	engine.say(words)
	engine.runAndWait()


talk("Привет")


def command():
	r = sr.Recognizer()
	with sr.Microphone() as source:
		print("Говорите")
		r.pause_threshold = 1
		r.adjust_for_ambient_noise(source, duration=1)
		audio = r.listen(source)

	try:
		zadanie = r.recognize_google(audio, language="ru-RU").lower()
		print("Вы сказали: " + zadanie)
	except sr.UnknownValueError:
		talk("Я вас не поняла")
		zadanie = command()
	return zadanie
def makeSomething(zadanie):

	if 'открой сайт' in zadanie:
		talk("Уже открываю")
		url = 'https://google.com'
		webbrowser.open(url)
	elif 'открой youtube' in zadanie:
		talk("Открываю")
		url = 'https://youtube.com'
		webbrowser.open(url)
	elif 'твое имя' in zadanie:
		talk("Меня зовут Сири")
	elif 'слава украине'in zadanie:
		talk("Героям слава!")
	elif 'стоп' or 'пока' or 'заткнись' in zadanie:
		talk("Да, конечно, досвидания")
		sys.exit()
while True:
	makeSomething(command())