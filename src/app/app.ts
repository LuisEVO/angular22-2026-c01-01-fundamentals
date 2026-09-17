import { Component } from '@angular/core';
import { EventModel } from './events/event-model';
import { Header } from './layout/header/header';

@Component({
  selector: 'app-root',
  imports: [Header],
  templateUrl: './app.html',
  styleUrl: './app.css',
})
export class App {
  protected readonly featuredEvent: EventModel = {
    title: 'Angular Summit Lima',
    description:
      'Una jornada presencial para explorar Angular moderno, arquitectura frontend y la comunidad que se está formando en Lima.',
    date: '2026-11-12',
    location: 'Lima, Perú',
    imageUrl: 'images/events/angular-summit-lima.svg',
  };
}
