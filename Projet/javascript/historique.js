document.addEventListener("DOMContentLoaded", () => {
    const events = document.querySelectorAll(".timeline-event");
  
    const handleScroll = () => {
      const triggerHeight = window.innerHeight * 0.8;
  
      events.forEach((event) => {
        const eventPosition = event.getBoundingClientRect().top;
  
        if (eventPosition < triggerHeight) {
          event.classList.add("visible");
        }
      });
    };
  
    window.addEventListener("scroll", handleScroll);
  
   
    handleScroll();})