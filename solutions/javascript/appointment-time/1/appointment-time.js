// @ts-check

/**
 * Create an appointment
 *
 * @param {number} days
 * @param {number} [now] (ms since the epoch, or undefined)
 *
 * @returns {Date} the appointment
 */
export function createAppointment(days, now = undefined) {
  let appointment;
  if(now==null){
    appointment=new Date();
  }else{
    appointment=new Date(now);
  }
  appointment.setDate(appointment.getDate()+days);
  return appointment;
}

/**
 * Generate the appointment timestamp
 *
 * @param {Date} appointmentDate
 *
 * @returns {string} timestamp
 */
export function getAppointmentTimestamp(appointmentDate) {
  return appointmentDate.toISOString();
}

/**
 * Get details of an appointment
 *
 * @param {string} timestamp (ISO 8601)
 *
 * @returns {Record<'year' | 'month' | 'date' | 'hour' | 'minute', number>} the appointment details
 */
export function getAppointmentDetails(timestamp) {
  let givenDate = new Date(timestamp);
  return {year:givenDate.getFullYear(),month:givenDate.getMonth(),date:givenDate.getDate(),hour:givenDate.getHours(),minute:givenDate.getMinutes()};
}

/**
 * Update an appointment with given options
 *
 * @param {string} timestamp (ISO 8601)
 * @param {Partial<Record<'year' | 'month' | 'date' | 'hour' | 'minute', number>>} options
 *
 * @returns {Record<'year' | 'month' | 'date' | 'hour' | 'minute', number>} the appointment details
 */
export function updateAppointment(timestamp, options) {
  let appointment = getAppointmentDetails(timestamp);
  for(let option in options){appointment[option]=options[option];}
  return getAppointmentDetails(new Date(appointment.year, appointment.month, appointment.date, appointment.hour, appointment.minute).toISOString());
}

/**
 * Get available time in seconds (rounded) between two appointments
 *
 * @param {string} timestampA (ISO 8601)
 * @param {string} timestampB (ISO 8601)
 *
 * @returns {number} amount of seconds (rounded)
 */
export function timeBetween(timestampA, timestampB) {
  let timeA = new Date(timestampA).getTime();
  let timeB = new Date(timestampB).getTime();
  return Math.round((timeB - timeA)/1000);
}

/**
 * Get available times between two appointment
 *
 * @param {string} appointmentTimestamp (ISO 8601)
 * @param {string} currentTimestamp (ISO 8601)
 */
export function isValid(appointmentTimestamp, currentTimestamp) {
  return timeBetween(appointmentTimestamp, currentTimestamp) < 0;
}
