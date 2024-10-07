window.addEventListener('message', function(event) {
    if (event.data.action === 'showNotify') {
        const notification = document.createElement('div');
        notification.classList.add('notify', event.data.type);
        let icon;
        switch(event.data.type) {
            case 'error':
                icon = '<i class="fas fa-exclamation-circle"></i>';
                break;
            case 'success':
                icon = '<i class="fas fa-check-circle"></i>';
                break;
            case 'info':
                icon = '<i class="fas fa-info-circle"></i>';
                break;
            case 'warning':
                icon = '<i class="fas fa-exclamation-triangle"></i>';
                break;
            default:
                icon = '<i class="fas fa-bell"></i>';
                break;
        }

        notification.innerHTML = `
            <div class="border"></div>
            <div class="title">${icon} ${event.data.title}</div>
            <div class="message">${event.data.message}</div>
        `;
        document.getElementById('notifyContainer').appendChild(notification);

        const totalTime = event.data.time;
        const interval = 100;
        const steps = totalTime / interval;
        const initialHeight = 100;
        const finalHeight = 0;

        let currentStep = 0;
        let currentRadius = 10;

        const heightInterval = setInterval(function() {
            if (currentStep < steps) {
                const border = notification.querySelector('.border');
                const newHeight = initialHeight * (1 - (currentStep / steps));
                border.style.height = newHeight + '%';
                border.style.borderRadius = `10px 0 0 ${currentRadius}px`;
                currentRadius = Math.max(0, currentRadius - 0.5);
                currentStep++;
            } else {
                clearInterval(heightInterval);
            }
        }, interval);

        setTimeout(function() {
            notification.classList.add('hide');
            setTimeout(function() {
                notification.remove();
            }, 500);
        }, totalTime);
    }
});