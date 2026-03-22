
extern void stm_setup(void);
extern uint64_t stm_now(void);
extern uint64_t stm_diff(uint64_t new_ticks, uint64_t old_ticks);
extern uint64_t stm_since(uint64_t start_ticks);
extern uint64_t stm_laptime(uint64_t* last_time);
extern uint64_t stm_round_to_common_refresh_rate(uint64_t frame_ticks);
extern double stm_sec(uint64_t ticks);
extern double stm_ms(uint64_t ticks);
extern double stm_us(uint64_t ticks);
extern double stm_ns(uint64_t ticks);


