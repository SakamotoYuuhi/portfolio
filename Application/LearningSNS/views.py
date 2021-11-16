from django.shortcuts import render
from rest_framework import generics

def index(request):
  msg = 'message!'
  params = {'msg': msg}
  return render(request, 'LearningSNS/index.html', params)