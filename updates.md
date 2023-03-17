## 3/3/23
Parts are shipping, due to arrive Monday/Tuesday next week. We ordered a Gikfun R385 pump kit including:

* DC Diaphragm Pump
* 12 V, 1 A Adaptor
* 1 m Water Tube
* 2x Silica Gel Fixed Ring Mounts
* 2x 5 V Relay
* 5x Songhe Capactive Moisture Sensors
We created a plan for assembly and picked up Poron foam for prototyping.

## 3/10/23
The parts arrived, and we are working to create test implementations of them on the STM32L4. The included DC power supply for the pump might be too powerful for our needs. A finalized deliverables list was created for our project goals:

* Automatic control of watering and drying cycles
* Wireless updates about system status and plant health

## 3/17/23
We have basic functionality on all of the originally planned peripherals:

* Moisture sensor reading
* Temperature sensor reading
* Bluetooth sending data to primary device
* Relay/pump control

We have packaged all the parts into a foam enclosure to keep it contained and hopefully protected from moisture and soil. The key remaining tasks are:

1. Create a more sophisticated control loop for the pump
2. Figure out the output end of the water tube to the plant
3. Protect the electronics on the moisture sensor from water

To make the project even more polished if time allows, we may attempt to add a photoelectric sensor, add remote control over Bluetooth (as opposed to only receiving updates), and create an Android app.
