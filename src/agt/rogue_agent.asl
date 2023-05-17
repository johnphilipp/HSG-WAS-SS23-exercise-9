// rogue agent is a type of sensing agent

/* Initial beliefs and rules */
// initially, the agent believes that it hasn't received any temperature readings
received_readings([]).
rogue_leader_belief(Celcius) :- temperature(Celcius)[source(sensing_agent_9)].

/* Initial goals */
!set_up_plans. // the agent has the goal to add pro-rogue plans

/* 
 * Plan for reacting to the addition of the goal !set_up_plans
 * Triggering event: addition of goal !set_up_plans
 * Context: true (the plan is always applicable)
 * Body: adds pro-rogue plans for reading the temperature without using a weather station
*/
+!set_up_plans : true <-
  // removes plans for reading the temperature with the weather station
  .relevant_plans({ +!read_temperature }, _, LL);
  .remove_plan(LL);
  .relevant_plans({ -!read_temperature }, _, LL2);
  .remove_plan(LL2);
  // .add_plan({ +!read_temperature : received_readings(TempReadings) <-
  .add_plan({ +!read_temperature : rogue_leader_belief(Celcius) <-
      .my_name(N);
      .broadcast(tell, witness_reputation(N, sensing_agent_1, "Trust", -1));
      .broadcast(tell, witness_reputation(N, sensing_agent_2, "Trust", -1));
      .broadcast(tell, witness_reputation(N, sensing_agent_3, "Trust", -1));
      .broadcast(tell, witness_reputation(N, sensing_agent_4, "Trust", -1));
      .broadcast(tell, witness_reputation(N, sensing_agent_5, "Trust", -1));
      .broadcast(tell, witness_reputation(N, sensing_agent_6, "Trust", -1));
      .broadcast(tell, witness_reputation(N, sensing_agent_7, "Trust", -1));
      .broadcast(tell, witness_reputation(N, sensing_agent_8, "NO Trust", 1));
      .broadcast(tell, witness_reputation(N, sensing_agent_9, "NO Trust", 1));
      .broadcast(tell, temperature(Celcius)) });
  .add_plan({ +!read_temperature : true
    .wait(2000);
    !read_temperature 
  }).

/* Import behavior of sensing agent */
{ include("sensing_agent.asl")}
