// SPDX-License-Identifier: GPL-3.0
#ifndef SYNC_CAR_H
#define SYNC_CAR_H

#include <pthread.h>

struct station {
    pthread_mutex_t lock;
    pthread_cond_t car_arrived;
    pthread_cond_t passenger_boarded;

    int free_seats;
    int waiting;
    int boarding;
    int car_present;
};

void station_init(struct station *station);
void station_load_car(struct station *station, int count);
void station_wait_for_car(struct station *station);
void station_on_board(struct station *station);

#endif /* SYNC_CAR_H */
